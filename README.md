# Plastid_slice
#genus Nucleotide divergence in IR LSC SSC
##Copy xlsx files
mkdir -p ~/data/organelle/LSC_slice/LSC/summary/xlsx
cd ~/data/organelle/LSC_slice/LSC/summary/xlsx

find ~/data/organelle/LSC_slice/LSC -type f -name "*.common.xlsx" |
    grep -v "vs[A-Z]" |
    parallel cp {} .


cd ~/data/organelle/LSC_slice/LSC/summary/xlsx

cat <<'EOF' > Table_alignment.tt
---
autofit: A:F
texts:
  - text: "Genus"
    pos: A1
  - text: "No. of genomes"
    pos: B1
  - text: "Aligned length (Mb)"
    pos: C1
  - text: "Indels Per 100 bp"
    pos: D1
  - text: "D on average"
    pos: E1
  - text: "GC-content"
    pos: F1
  - text: "Coding portions"
    pos: G1
  - text: "Repeats portions"
    pos: H1
[% FOREACH item IN data -%]
  - text: [% item.name %]
    pos: A[% loop.index + 2 %]
[% END -%]
borders:
  - range: A1:F1
    top: 1
  - range: A1:F1
    bottom: 1
ranges:
[% FOREACH item IN data -%]
  [% item.file %]:
    basic:
      - copy: B2
        paste: B[% loop.index + 2 %]
      - copy: B4
        paste: C[% loop.index + 2 %]
      - copy: B5
        paste: D[% loop.index + 2 %]
      - copy: B7
        paste: E[% loop.index + 2 %]
      - copy: B8
        paste: F[% loop.index + 2 %]
      - copy: B9
        paste: G[% loop.index + 2 %]
      - copy: B10
        paste: H[% loop.index + 2 %]
[% END -%]
EOF

cat ~/data/organelle/plastid/summary/group/Angiosperms.lst |
    grep -v "^#" |
    TT_FILE=Table_alignment.tt perl -MTemplate -nl -e '
        push @data, { name => $_, file => qq{$_.common.xlsx}, };
        END {
            $tt = Template->new;
            $tt->process($ENV{TT_FILE}, { data => \@data, })
                or die Template->error;
        }
    ' \
    > Table_alignment_lsc.yml

perl ~/Scripts/fig_table/xlsx_table.pl -i Table_alignment_lsc.yml
perl ~/Scripts/fig_table/xlsx2csv.pl -f Table_alignment_lsc.xlsx > Table_alignment_lsc.csv
mkdir -p ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_lsc.xlsx ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_lsc.csv ~/data/organelle/LSC_slice/summary/table

mkdir -p ~/data/organelle/LSC_slice/SSC/summary/xlsx
cd ~/data/organelle/LSC_slice/SSC/summary/xlsx

find ~/data/organelle/LSC_slice/SSC -type f -name "*.common.xlsx" |
    grep -v "vs[A-Z]" |
    parallel cp {} .


cd ~/data/organelle/LSC_slice/SSC/summary/xlsx

cat <<'EOF' > Table_alignment.tt
---
autofit: A:F
texts:
  - text: "Genus"
    pos: A1
  - text: "No. of genomes"
    pos: B1
  - text: "Aligned length (Mb)"
    pos: C1
  - text: "Indels Per 100 bp"
    pos: D1
  - text: "D on average"
    pos: E1
  - text: "GC-content"
    pos: F1
  - text: "Coding portions"
    pos: G1
  - text: "Repeats portions"
    pos: H1
[% FOREACH item IN data -%]
  - text: [% item.name %]
    pos: A[% loop.index + 2 %]
[% END -%]
borders:
  - range: A1:F1
    top: 1
  - range: A1:F1
    bottom: 1
ranges:
[% FOREACH item IN data -%]
  [% item.file %]:
    basic:
      - copy: B2
        paste: B[% loop.index + 2 %]
      - copy: B4
        paste: C[% loop.index + 2 %]
      - copy: B5
        paste: D[% loop.index + 2 %]
      - copy: B7
        paste: E[% loop.index + 2 %]
      - copy: B8
        paste: F[% loop.index + 2 %]
      - copy: B9
        paste: G[% loop.index + 2 %]
      - copy: B10
        paste: H[% loop.index + 2 %]
[% END -%]
EOF

cat ~/data/organelle/plastid/summary/group/Angiosperms.lst |
    grep -v "^#" |
    TT_FILE=Table_alignment.tt perl -MTemplate -nl -e '
        push @data, { name => $_, file => qq{$_.common.xlsx}, };
        END {
            $tt = Template->new;
            $tt->process($ENV{TT_FILE}, { data => \@data, })
                or die Template->error;
        }
    ' \
    > Table_alignment_ssc.yml

perl ~/Scripts/fig_table/xlsx_table.pl -i Table_alignment_ssc.yml
perl ~/Scripts/fig_table/xlsx2csv.pl -f Table_alignment_ssc.xlsx > Table_alignment_ssc.csv
mkdir -p ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_ssc.xlsx ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_ssc.csv ~/data/organelle/LSC_slice/summary/table

mkdir -p ~/data/organelle/LSC_slice/IR/summary/xlsx
cd ~/data/organelle/LSC_slice/IR/summary/xlsx

find ~/data/organelle/LSC_slice/IR -type f -name "*.common.xlsx" |
    grep -v "vs[A-Z]" |
    parallel cp {} .


cd ~/data/organelle/LSC_slice/IR/summary/xlsx

cat <<'EOF' > Table_alignment.tt
---
autofit: A:F
texts:
  - text: "Genus"
    pos: A1
  - text: "No. of genomes"
    pos: B1
  - text: "Aligned length (Mb)"
    pos: C1
  - text: "Indels Per 100 bp"
    pos: D1
  - text: "D on average"
    pos: E1
  - text: "GC-content"
    pos: F1
  - text: "Coding portions"
    pos: G1
  - text: "Repeats portions"
    pos: H1
[% FOREACH item IN data -%]
  - text: [% item.name %]
    pos: A[% loop.index + 2 %]
[% END -%]
borders:
  - range: A1:F1
    top: 1
  - range: A1:F1
    bottom: 1
ranges:
[% FOREACH item IN data -%]
  [% item.file %]:
    basic:
      - copy: B2
        paste: B[% loop.index + 2 %]
      - copy: B4
        paste: C[% loop.index + 2 %]
      - copy: B5
        paste: D[% loop.index + 2 %]
      - copy: B7
        paste: E[% loop.index + 2 %]
      - copy: B8
        paste: F[% loop.index + 2 %]
      - copy: B9
        paste: G[% loop.index + 2 %]
      - copy: B10
        paste: H[% loop.index + 2 %]
[% END -%]
EOF

cat ~/data/organelle/plastid/summary/group/Angiosperms.lst |
    grep -v "^#" |
    TT_FILE=Table_alignment.tt perl -MTemplate -nl -e '
        push @data, { name => $_, file => qq{$_.common.xlsx}, };
        END {
            $tt = Template->new;
            $tt->process($ENV{TT_FILE}, { data => \@data, })
                or die Template->error;
        }
    ' \
    > Table_alignment_IR.yml

perl ~/Scripts/fig_table/xlsx_table.pl -i Table_alignment_IR.yml
perl ~/Scripts/fig_table/xlsx2csv.pl -f Table_alignment_IR.xlsx > Table_alignment_IR.csv
mkdir -p ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_IR.xlsx ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_IR.csv ~/data/organelle/LSC_slice/summary/table

cp -f Table_alignment_Angiosperms.xlsx ~/data/organelle/LSC_slice/summary/table
cp -f Table_alignment_Angiosperms.csv ~/data/organelle/LSC_slice/summary/table

cd ~/data/organelle/LSC_slice/summary/table
fasops mergecsv Table_alignment_Angiosperms.csv Table_alignment_lsc.csv Table_alignment_ssc.csv Table_alignment_IR.csv Table_alignment_LSC21.csv Table_alignment_LSC22.csv  Table_alignment_LSC31.csv Table_alignment_LSC32.csv Table_alignment_LSC33.csv  -o total.csv -c

echo "Genus,cpDNA,lsc,ssc,IR,LSC21,LSC22,LSC31,LSC32,LSC33" > indel.csv
echo "Genus,cpDNA,lsc,ssc,IR,LSC21,LSC22,LSC31,LSC32,LSC33" > D.csv
echo "Genus,cpDNA,lsc,ssc,IR,LSC21,LSC22,LSC31,LSC32,LSC33" > GC.csv
echo "Genus,cpDNA,lsc,ssc,IR,LSC21,LSC22,LSC31,LSC32,LSC33" > cds.csv
echo "Genus,cpDNA,lsc,ssc,IR,LSC21,LSC22,LSC31,LSC32,LSC33" > repeat.csv
cat total.csv | perl -na -F"," -e  ' print $F[0],",",$F[3],",",$F[10],",", $F[17],",",$F[24],",",$F[31],",",$F[38],",",$F[45],",",$F[52],",",$F[59],"\n" ' >> indel.csv
cat total.csv | perl -na -F"," -e  ' print $F[0],",",$F[4],",",$F[11],",", $F[18],",",$F[25],",",$F[32],",",$F[39],",",$F[46],",",$F[53],",",$F[60],"\n" ' >> D.csv
cat total.csv | perl -na -F"," -e  ' print $F[0],",",$F[5],",",$F[12],",", $F[19],",",$F[26],",",$F[33],",",$F[40],",",$F[47],",",$F[54],",",$F[61],"\n" ' >> GC.csv
cat total.csv | perl -na -F"," -e  ' print $F[0],",",$F[6],",",$F[13],",", $F[20],",",$F[27],",",$F[34],",",$F[41],",",$F[48],",",$F[55],",",$F[62],"\n" ' >> cds.csv
cat total.csv | perl -na -F"," -e  ' print $F[0],",",$F[7],",",$F[14],",", $F[21],",",$F[28],",",$F[35],",",$F[42],",",$F[49],",",$F[56],",",$F[63],"\n" ' >> repeat.csv

# Correlation
