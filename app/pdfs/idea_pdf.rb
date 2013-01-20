#encoding: UTF-8
class IdeaPdf < Prawn::Document
  def initialize(idea)
    super(:page_layout => :landscape)
    @idea = idea
    #font "Helvetica Neue", "Helvetica", "Arial", "sans-serif"

    file = "#{Prawn::DATADIR}/fonts/gkai00mp.ttf"
    font_families["Kai"] = {
      :normal => { :file => file, :font => "Kai" }
    }

    title
    ideaCanvas
  end

  def title
    text "#{@idea.title}",size: 30, style: :bold
  end

  def ideaCanvas
    move_down 20

    metrics = @idea.metrics.map {|m| m.title }.collect {|m| "·" + m }.join("\n")
    solutions = @idea.solutions.map {|s| s.feature }.collect {|m| "·" + m }.join("\n")
    uvps = @idea.uvps.map {|u| u.title }.collect {|m| "·" + m }.join("\n")
    advantages = @idea.advantages.map {|a| a.title }.collect {|m| "·" + m }.join("\n")
    segments = @idea.customer_segments.map {|c| c.title }.collect {|m| "·" + m }.join("\n")
    channels = @idea.channels.map {|ch| ch.title }.collect {|m| "·" + m }.join("\n")
    structure = @idea.structure.map {|st| st.title }.collect {|m| "·" + m }.join("\n")
    revenue = @idea.revenue.map {|r| r.title }.collect {|m| "·" + m }.join("\n")
    problems = @idea.problems.map {|p| p.title }.collect {|m| "·" + m }.join("\n")

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

    table(tabledata, :width => 700,:cell_style => {:width => 120,:font =>"Kai", :inline_format => true} )
  end
end

