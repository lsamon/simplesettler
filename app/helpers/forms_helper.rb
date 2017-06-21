module FormsHelper
  def enum_collection(f, column, options={})
    options.reverse_merge!(sort: false)
    keys = f.object.class.send(column).keys
    keys.sort! if options[:sort]
    keys.collect{|c| [t("#{f.object.class.base_class.table_name}.#{column.to_s}.#{c}"), c]}
  end
end
