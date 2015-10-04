# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    info = []
    @data = []
    programmer = {}
    file = tsv.split("\n")
    first_line = file.first
    info = first_line.split("\t")
    file.shift
    file.each{|x| @data << info.zip(x.split("\t")).to_h }
    @data
 end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    info = @data[0].keys
    result = []
    result << info.join("\t")
    line = []
    @data.each do |dict|
      dict.each do | _, value|
        line << value
      end
      result << line.join("\t")
      line = []
    end
    result
  end
end
