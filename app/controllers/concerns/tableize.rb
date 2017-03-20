module Tableize
  extend ActiveSupport::Concern

  # Table stuff

  def add_table_filters(query, table_filters, options={})
    @table_filters = table_filters.values.flatten
    @selected_filters = (params[:filter] || cookies["#{controller_name}_filter"]).to_s.split(',')

    @selected_filters = [@table_filters.first] if @selected_filters.empty? || (@selected_filters - @table_filters).any?
    cookies["#{controller_name}_filter"] = @selected_filters.join(',')
    conditions = {}
    table_filters.each do |k,v|
      conditions[k] = [] if v.is_a?(Array)
    end
    if !@selected_filters.include?('all')
      @selected_filters.each do |filter|
        table_filter_conditions(conditions, filter)
      end
      conditions.each do |column, values|
        if values.length > 0
          if options.key?(:custom) && options[:custom].include?(column)
            if values.length == 1
              query = query.where(values.first)
            else
              query = query.where("(#{values.join(' OR ')})")
            end
          else
            query = query.where(column => values)
          end
        end
      end
    end
    query
  end

  def sort_order(method_lead = nil)
    if method_lead.is_a?(Hash)
      options = method_lead
    else
      options = method_lead.nil? ? sort_options : send("#{method_lead}_sort_options")
    end
    col = options[params[:col]] || options.values.first
    dir = ['ASC', 'DESC'].detect{|d| params[:dir] == d } || default_direction
    params[:col] ||= options.keys.first
    params[:dir] = dir
    "#{col} #{dir}"
  end

  def default_direction
    'ASC'
  end

end
