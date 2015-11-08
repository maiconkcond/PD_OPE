json.array!(@unid_meds) do |unid_med|
  json.extract! unid_med, :id, :descricao, :abreviacao
  json.url unid_med_url(unid_med, format: :json)
end
