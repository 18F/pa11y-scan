require 'bundler/setup'
require 'pry'
require 'json'

def get_counts(report)
  {
    notices: report.select {|r| r["type"] == "notice"}.length,
    errors: report.select {|r| r["type"] == "error"}.length,
    warning: report.select {|r| r["type"] == "warning"}.length
  }
end

big_report = []

Dir.glob('results/*.json') do |file|
  begin
    report = JSON.parse(File.read(file))
    counts = get_counts(report)
    
    big_report << {
      domain: file
    }.merge(counts)
  rescue
    big_report << {
      domain: file,
      error: true
    }
  end
end

errors = big_report.select {|i| i.has_key? :error}

no_errors = big_report.select {|i| !i.has_key?(:error)}

sorted_by_errors = no_errors.sort_by { |k| k[:errors] }.reverse

stats = {
  total_domains: big_report.length,
  cant_scan: errors.length,
  worst: sorted_by_errors[0..10],
  best: sorted_by_errors.reverse[0..10]
}


binding.pry