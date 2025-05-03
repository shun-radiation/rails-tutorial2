module WeightHistoriesHelper
  def weight_comment(weight)
    if weight < 20
      "#{weight} (痩せ型)"
    else
      weight
    end
  end
end
