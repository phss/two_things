TwoThings.helpers do
  def meta_for(entry)
    creation_date = entry.created_at.strftime("%d %b %Y")
    meta = blank?(entry.created_by) ? "On #{creation_date}." : "By #{entry.created_by} on #{creation_date}."
    
    meta += " Source: " + link_to(entry.source, entry.source, :class => 'link') unless blank?(entry.source)

    return meta
  end

 private
  def blank?(string)
    string.nil? || string.strip.size == 0
  end
end
