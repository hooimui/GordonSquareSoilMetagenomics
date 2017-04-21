# Gordon Square Soil Metagenomics
Both datasets (this year's and last year's) were uploaded to UCL high performance compute cluster Legion and processed according to the bash scripts `Scripts/2016_cr_join_no_golay.sh` and `Scripts/2017_cr_nojoin_no_golay.sh`. The standard output from these scripts is saved in `Scripts/2016_stdout` and `Scripts/2017_stdout`, respectively.

The files contain several lines of codes starting with \#, which are instructions for the HPC job queue. Such as how long the job will run on how many cores, how much RAM and storage is required.

For 2016's data both reads were joined, prior to de-multiplexing. As 2017's second read data was of lower quality, joining was skipped and only read1 was processed.

After picking OTUs with the Greengenes reference the BIOM-formated tables were merged with the command in `Scripts/merge_otu_tables.sh`.

Any of the phylogentic trees found in `2016/otus` or `2017/otus` can be used for further analysis as this is the Greengenes reference tree.

With the merged BIOM-formated table `merged_otu_table.biom` and phylogenetic tree `97_otus.tree`, the downstream analysis is performed using the command in `Scripts/data_analysis.sh`
