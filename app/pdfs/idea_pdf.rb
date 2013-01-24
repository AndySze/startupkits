#encoding: UTF-8
class IdeaPdf < Prawn::Document
  def initialize(idea)
    super(:page_layout => :landscape)
    @idea = idea
    #font "Helvetica Neue", "Helvetica", "Arial", "sans-serif"

    kai = "#{Prawn::DATADIR}/fonts/gkai00mp.ttf"
    simhei = "#{Prawn::DATADIR}/fonts/SimHei.ttf"
    font_families["Kai"] = {
      :normal => { :file => kai, :font => "Kai" }
    }
    font_families["SimHei"] = {
      :normal => { :file => simhei, :font => "SimHei" }
    }

    font(kai, :size => 30,style: :bold) do
      text "#{@idea.title}"
    end

    ideaCanvas
    info
  end

  def info
    move_down 20
    text "Created at: http://startup.taolinggan.com/",size: 10, :color => "b0b0b0"
  end

  def ideaCanvas
    move_down 15

    metrics = @idea.metrics.map {|m| "·" + m.title }.join("\n")
    solutions = @idea.solutions.map {|s| "·" + s.feature }.join("\n")
    uvps = @idea.uvps.map {|u| "·" + u.title }.join("\n")
    advantages = @idea.advantages.map {|a| "·" + a.title }.join("\n")
    segments = @idea.customer_segments.map {|c| "·" + c.title }.join("\n")
    channels = @idea.channels.map {|ch| "·" + ch.title }.join("\n")
    structure = @idea.structure.map {|st| "·" + st.title }.join("\n")
    revenue = @idea.revenue.map {|r| "·" + r.title }.join("\n")
    problems = @idea.problems.map {|p| "·" + p.title }.join("\n")

    tabledata = [
      [{:content => "<font size='15'>Problem</font>\n\n" + problems, :colspan => 2, :rowspan => 2},
       {:content => "<font size='15'>Solution</font>\n\n" + solutions, :colspan => 2},
       {:content => "<font size='15'>Unique Value Proposition</font>\n\n" + uvps, :colspan => 2, :rowspan => 2},
       {:content => "<font size='15'>Unfair Advantage</font>\n\n" + advantages, :colspan =>2},
       {:content => "<font size='15'>Customer Segments</font>\n\n" + segments, :colspan => 2,:rowspan => 2}],

      [{:content => "<font size='15'>Key Metrics</font>\n\n"+ metrics, :colspan => 2},
       {:content => "<font size='15'>Channels</font>\n\n" + channels,:colspan => 2}],

      [{:content => "<font size='15'>Cost Structure</font>\n\n" + structure, :colspan => 5},
       {:content => "<font size='15'>Revenue Streams</font>\n\n" + revenue, :colspan => 5}],
    ]

    table(tabledata, :width => 700, :cell_style => {:width => 120,:font =>"Kai", :inline_format => true} )
  end
end

