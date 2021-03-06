#!/bin/bash
#To carry out several QIIME diversity analyses together
core_diversity_analyses.py -i merged_otu_table.biom -o core_output -m mapping_file_new_corrected.txt -c Day, Month, Year, Longitude, Latitude -t 97_otus.tree -e 370000

#Compute alpha diversity for Shannon index and generate alpha rarefaction plots
#To generate a parameter file
echo "alpha_diversity:metrics shannon" > alpha_params.txt
alpha_rarefaction.py -i merged_otu_table.biom -m mapping_file_new_corrected.txt -o wf_arare_Shannon -p alpha_params.txt -t 97_otus.tree

#Jackknifed beta diversity 
jackknifed_beta_diversity.py -i merged_otu_table.biom -t 97_otus.tree -m mapping_file_new_corrected.txt -o bdiv_jk370000 -e 370000
	

#Category comparison techniques using ADONIS
compare_categories.py --method adonis -i bdiv_jk370000/unweighted_unifrac/pcoa -m mapping_file_new_corrected.txt -c Month,Year,Day,Latitude,Longitude -o adonis_out -n 10000

