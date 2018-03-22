def sort_algo(sample_list)
  tmp = sample_list[0]
  sample_list[0] = sample_list[-1]
  sample_list[-1] = tmp

  return sample_list
end

sample_list = [1, 2, 3]
p sort_algo(sample_list)