ディレクトリ構造，ファイル名がおかしいと動かにゃいので注意．
落としてきたzipファイルから日付をのぞいたものをディレクトリ名にすると楽．
対応するcsvは作成したディレクトリ名と合わせてその中に配置．
dirs.txtにて，対象のディレクトリを指定する．.dirs.txt.templateを参照してディレクトリ名を決めてくれるといいな．


```
├── ADNI1_Baseline_3T
│   ├── ADNI
│   └── ADNI1_Baseline_3T.csv
├── ADNI1_Baseline_3T.zip
├── ADNI1_Baseline_3T_fullpath.txt
├── README.md
├── createdirs.py
├── dirs.txt << このファイルに処理したいファイル（ディレクトリ）を書いておく
├── dumpfilenames.py
└── skullstripping.sh
```

.bashrcに以下を追加(~/DSTにファイルを格納していく場合)
```
export FREESURFER_DST=${HOME}/DST
```
スクリプト書くの面倒だった，以下手動で作って
```
$ mkdir $FREESURFER_DST/AD
$ mkdir $FREESURFER_DST/CN
$ mkdir $FREESURFER_DST/MCI
```
