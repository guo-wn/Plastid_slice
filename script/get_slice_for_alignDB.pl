use File::Find::Rule;

	# find all the .blastm6 files in @INC
	my @files = File::Find::Rule->file()
                              ->name( '*.maf.gz.fas.gz' )
                              ->in( '/home/gwn/data/organelle/plastid/genus' );
	my @data;
	my @data1;
	my $data2;
	my %hash;

	open IN, "/home/gwn/data/organelle/plastid/summary/ABBR.csv" || die "$!";
	open OUT, ">", $ARGV[0];
    #open OUT, ">cover_slice_cmd.sh" or die $!;
	while ( <IN> ){
		chomp;
		@data2 =split ",",$_;
		#print $data2[9],"\n";
		$hash{ $data2[1]}= $data2[9];
		}
	foreach $file( @files ){
		@data =split "/",$file;
		@data1=split /\./,$data[9],2;

		#print $data1[0],"\n";

		print OUT "cd ~/data/organelle/LSC_slice/LSC
                  mkdir $data[7]
                  cd $data[7]","\n",

                  "fasops slice '$file'  '/home/gwn/data/organelle/yml/$hash{ $data1[0] }.LSC.yml' -n $hash{ $data1[0] } -o $data[7]_LSC.fas
                  perl /home/gwn/Scripts/egaz/../alignDB/alignDB.pl  \-d $data[7] \ \-da /home/gwn/data/organelle/LSC_slice/LSC/$data[7]/$data[7]_LSC.fas \ \-a /home/gwn/data/organelle/yml/$hash{ $data1[0] }.LSC.yml \ \-chr /home/gwn/data/organelle/plastid/genus/$data[7]/Results/chr_length.csv \ \-lt 1000 --parallel 20 --batch 5 \ \--run 1,2,5,10,21,30-32,40-42,44","\n",
                  "cd ~/data/organelle/LSC_slice/SSC
                  mkdir $data[7]
                  cd $data[7]","\n",

                  "fasops slice '$file'  '/home/gwn/data/organelle/yml/$hash{ $data1[0] }.SSC.yml' -n $hash{ $data1[0] } -o $data[7]_SSC.fas
                  perl /home/gwn/Scripts/egaz/../alignDB/alignDB.pl  \-d $data[7] \ \-da /home/gwn/data/organelle/LSC_slice/SSC/$data[7]/$data[7]_SSC.fas \ \-a /home/gwn/data/organelle/yml/$hash{ $data1[0] }.SSC.yml \ \-chr /home/gwn/data/organelle/plastid/genus/$data[7]/Results/chr_length.csv \ \-lt 1000 --parallel 20 --batch 5 \ \--run 1,2,5,10,21,30-32,40-42,44","\n",
                  "cd ~/data/organelle/LSC_slice/IR
                  mkdir $data[7]
                  cd $data[7]","\n",

                  "fasops slice '$file'  '/home/gwn/data/organelle/yml/$hash{ $data1[0] }.IR.yml' -n $hash{ $data1[0] } -o $data[7]_IR.fas
                  perl /home/gwn/Scripts/egaz/../alignDB/alignDB.pl  \-d $data[7] \ \-da /home/gwn/data/organelle/LSC_slice/IR/$data[7]/$data[7]_IR.fas \ \-a /home/gwn/data/organelle/yml/$hash{ $data1[0] }.IR.yml \ \-chr /home/gwn/data/organelle/plastid/genus/$data[7]/Results/chr_length.csv \ \-lt 1000 --parallel 20 --batch 5 \ \--run 1,2,5,10,21,30-32,40-42,44","\n",

                  "cd ~/data/organelle/LSC_slice/LSC21
                  mkdir $data[7]
                  cd $data[7]","\n",

                  "fasops slice '$file'  '/home/gwn/data/organelle/yml/$hash{ $data1[0] }.LSC21.yml' -n $hash{ $data1[0] } -o $data[7]_LSC21.fas
                  perl /home/gwn/Scripts/egaz/../alignDB/alignDB.pl  \-d $data[7] \ \-da /home/gwn/data/organelle/LSC_slice/LSC21/$data[7]/$data[7]_LSC21.fas \ \-a /home/gwn/data/organelle/yml/$hash{ $data1[0] }.LSC21.yml \ \-chr /home/gwn/data/organelle/plastid/genus/$data[7]/Results/chr_length.csv \ \-lt 1000 --parallel 20 --batch 5 \ \--run 1,2,5,10,21,30-32,40-42,44","\n",
                  "cd ~/data/organelle/LSC_slice/LSC22
                  mkdir $data[7]
                  cd $data[7]","\n",

                  "fasops slice '$file'  '/home/gwn/data/organelle/yml/$hash{ $data1[0] }.LSC22.yml' -n $hash{ $data1[0] } -o $data[7]_LSC22.fas
                  perl /home/gwn/Scripts/egaz/../alignDB/alignDB.pl  \-d $data[7] \ \-da /home/gwn/data/organelle/LSC_slice/LSC22/$data[7]/$data[7]_LSC22.fas \ \-a /home/gwn/data/organelle/yml/$hash{ $data1[0] }.LSC22.yml \ \-chr /home/gwn/data/organelle/plastid/genus/$data[7]/Results/chr_length.csv \ \-lt 1000 --parallel 20 --batch 5 \ \--run 1,2,5,10,21,30-32,40-42,44","\n",
                  "cd ~/data/organelle/LSC_slice/CDS
                   mkdir $data[7]
                   cd $data[7]","\n",

                   "fasops slice '$file'  '/home/gwn/data/organelle/yml/$data[7].cds.yml' -n $hash{ $data1[0] } -o $hash{ $data1[0] }.cds.fas
                   perl /home/gwn/Scripts/egaz/../alignDB/alignDB.pl  \-d $data[7] \ \-da /home/gwn/data/organelle/LSC_slice/CDS/$data[7]/$hash{ $data1[0] }.cds.fas \ \-a /home/gwn/data/organelle/yml/$data[7].cds.yml \ \-chr /home/gwn/data/organelle/plastid/genus/$data[7]/Results/chr_length.csv \ \-lt 1000 --parallel 20 --batch 5 \ \--run 1,2,5,10,21,30-32,40-42,44","\n";

    }
    close IN;
    close OUT;