From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] glibc update is broken in testing?
Date: Sat, 29 May 2004 12:49:10 -0600
Message-ID: <20040529184910.GA11441__31574.8732457452$1416623462$gmane$org@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Heads up,
During an update from "dselect", my /lib/ld.so.1 went missing.
It's not clear if this is a kernel bug or a bug with the glibc update.

Verified /lib/ld-2.3.2.so is still present with "echo /lib/ld*".

System is basically useless until I cold install or fix up
the /lib/ld.so.1 symlink. 

dselect/apt-get output appended.

grant

ps. The update is going through a proxy/squid cache to talk to m.k.o.
I usually update several machines at the same time pretty quickly this way.
I do not have a 6MB/s link to m.k.o. :^)

on:~# dselect
Get:1 http://mirrors.kernel.org testing/main Packages [2835kB]
Get:2 http://mirrors.kernel.org testing/main Release [81B]
Get:3 http://mirrors.kernel.org testing/non-free Packages [40.5kB]
Get:4 http://mirrors.kernel.org testing/non-free Release [85B]
Get:5 http://mirrors.kernel.org testing/contrib Packages [49.5kB]
Get:6 http://mirrors.kernel.org testing/contrib Release [84B]
Get:7 http://mirrors.kernel.org testing/main Sources [1162kB]
Get:8 http://mirrors.kernel.org testing/main Release [83B]
Get:9 http://mirrors.kernel.org testing/non-free Sources [25.3kB]
Get:10 http://mirrors.kernel.org testing/non-free Release [87B]
Get:11 http://mirrors.kernel.org testing/contrib Sources [26.8kB]
Get:12 http://mirrors.kernel.org testing/contrib Release [86B]
Fetched 4140kB in 4s (927kB/s)                    
Reading Package Lists... Done
Merging Available information
Replacing available packages info, using /var/cache/apt/available.
Information about 13398 package(s) was updated.
Reading Package Lists... Done
Building Dependency Tree... Done
The following NEW packages will be installed:
  emacs21-bin-common libungif4g vim-common
The following packages will be upgraded:
  adduser apt apt-utils autotools-dev base-files bash bc bind9-host binutils
  bsdmainutils console-common console-data cpp-3.3 cvs cxref dash dbs dc
  debconf debconf-i18n debconf-utils debhelper debianutils dictionaries-common
  distcc dnsutils doc-linux-text dpkg dpkg-dev dselect e2fslibs e2fsprogs
  emacs21 emacs21-common exim fakeroot flex fontconfig g++-3.3 gcc-3.3
  gcc-3.3-base gdb hddtemp ifupdown initrd-tools initscripts intltool-debian
  iptables kernel-package libattr1 libblkid1 libc6 libc6-dev libcap1
  libcomerr2 libconsole libdb3 libdb3-util libdb4.0 libdns11 libdps1
  libfontconfig1 libfontconfig1-dev libgcc1 libice-dev libice6 libisc7
  libkpathsea3 liblwres1 libnewt0.51 libpam-modules libpam-runtime libpam0g
  libpam0g-dev libpng10-0 libpng12-0 libpng12-dev libpng2 libsm-dev libsm6
  libss2 libssl0.9.7 libstdc++5 libstdc++5-3.3-dev libt1-5 libtasn1-0
  libtasn1-2 libtool libuuid1 libwrap0 libx11-6 libx11-dev libxaw7
  libxcursor-dev libxcursor1 libxext-dev libxext6 libxft1 libxi-dev libxi6
  libxmu-dev libxmu6 libxmuu-dev libxmuu1 libxp-dev libxp6 libxpm-dev libxpm4
  libxrandr-dev libxrandr2 libxt-dev libxt6 libxtrap-dev libxtrap6 libxtst-dev
  libxtst6 libxv-dev libxv1 locales login lsof make makedev man-db
  module-init-tools net-tools netbase ntpdate palo passwd pciutils pkg-config
  pm-dev po-debconf portmap ppp pppconfig pppoeconf procps proftpd
  proftpd-common python-newt python2.3 reportbug rsync scsitools sed ssh
  strace sysv-rc sysvinit tar tasksel tcpd tetex-base tetex-bin time ucf vim
  whiptail whois x-dev xbase-clients xfree86-common xlibmesa-gl xlibmesa-glu
  xlibs xlibs-data xlibs-dev xlibs-static-dev xterm zlib1g zlib1g-dev
173 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
Need to get 108MB of archives.
After unpacking 3528kB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://mirrors.kernel.org testing/main base-files 3.0.15 [34.0kB]
Get:2 http://mirrors.kernel.org testing/main bash 2.05b-15 [681kB]
Get:3 http://mirrors.kernel.org testing/main debianutils 2.8.2 [43.5kB]
Get:4 http://mirrors.kernel.org testing/main dpkg 1.10.21 [1256kB]
Get:5 http://mirrors.kernel.org testing/main libc6-dev 2.3.2.ds1-12 [3029kB]
Get:6 http://mirrors.kernel.org testing/main debconf-i18n 1.4.25 [65.4kB]
Get:7 http://mirrors.kernel.org testing/main debconf 1.4.25 [98.1kB]
Get:8 http://mirrors.kernel.org testing/main locales 2.3.2.ds1-12 [3978kB]
Get:9 http://mirrors.kernel.org testing/main libc6 2.3.2.ds1-12 [4353kB]
Get:10 http://mirrors.kernel.org testing/main e2fslibs 1.35-6 [84.9kB]
Get:11 http://mirrors.kernel.org testing/main e2fsprogs 1.35-6 [495kB]
Get:12 http://mirrors.kernel.org testing/main libdb3 3.2.9-19.1 [268kB]
Get:13 http://mirrors.kernel.org testing/main libcap1 1:1.10-14 [10.2kB]
Get:14 http://mirrors.kernel.org testing/main libpam0g-dev 0.76-21 [115kB]
Get:15 http://mirrors.kernel.org testing/main libpam-runtime 0.76-21 [59.0kB]
Get:16 http://mirrors.kernel.org testing/main libpam0g 0.76-21 [78.2kB]
Get:17 http://mirrors.kernel.org testing/main libpam-modules 0.76-21 [173kB]
Get:18 http://mirrors.kernel.org testing/main login 1:4.0.3-28.3 [356kB]
Get:19 http://mirrors.kernel.org testing/main sed 4.0.9-3 [217kB]
Get:20 http://mirrors.kernel.org testing/main sysvinit 2.85-15 [101kB]
Get:21 http://mirrors.kernel.org testing/main tar 1.13.93-4 [514kB]
Get:22 http://mirrors.kernel.org testing/main console-data 2002.12.04dbs-39 [1109kB]
Get:23 http://mirrors.kernel.org testing/main console-common 0.7.42 [77.6kB]
Get:24 http://mirrors.kernel.org testing/main dash 0.4.26 [93.0kB]
Get:25 http://mirrors.kernel.org testing/main ucf 1.06 [33.5kB]
Get:26 http://mirrors.kernel.org testing/main tetex-base 2.0.2-8 [14.3MB]
Get:27 http://mirrors.kernel.org testing/main libgcc1 1:3.3.3-6 [76.8kB]
Get:28 http://mirrors.kernel.org testing/main x-dev 4.3.0.dfsg.1-1 [183kB]
Get:29 http://mirrors.kernel.org testing/main libice-dev 4.3.0.dfsg.1-1 [179kB]
Get:30 http://mirrors.kernel.org testing/main libice6 4.3.0.dfsg.1-1 [172kB]
Get:31 http://mirrors.kernel.org testing/main libsm-dev 4.3.0.dfsg.1-1 [145kB]
Get:32 http://mirrors.kernel.org testing/main libsm6 4.3.0.dfsg.1-1 [149kB]
Get:33 http://mirrors.kernel.org testing/main libx11-dev 4.3.0.dfsg.1-1 [1414kB]
Get:34 http://mirrors.kernel.org testing/main xfree86-common 4.3.0.dfsg.1-1 [691kB]
Get:35 http://mirrors.kernel.org testing/main xlibs-data 4.3.0.dfsg.1-1 [863kB]
Get:36 http://mirrors.kernel.org testing/main libx11-6 4.3.0.dfsg.1-1 [734kB]
Get:37 http://mirrors.kernel.org testing/main libxext-dev 4.3.0.dfsg.1-1 [220kB]
Get:38 http://mirrors.kernel.org testing/main libxext6 4.3.0.dfsg.1-1 [159kB]
Get:39 http://mirrors.kernel.org testing/main pkg-config 0.15.0-4 [35.0kB]
Get:40 http://mirrors.kernel.org testing/main libfontconfig1-dev 2.2.2-2 [242kB]
Get:41 http://mirrors.kernel.org testing/main zlib1g-dev 1:1.2.1.1-3 [431kB]
Get:42 http://mirrors.kernel.org testing/main zlib1g 1:1.2.1.1-3 [68.9kB]
Get:43 http://mirrors.kernel.org testing/main fontconfig 2.2.2-2 [57.9kB]
Get:44 http://mirrors.kernel.org testing/main libfontconfig1 2.2.2-2 [103kB]
Get:45 http://mirrors.kernel.org testing/main libxft1 4.3.0.dfsg.1-1 [158kB]
Get:46 http://mirrors.kernel.org testing/main libxi-dev 4.3.0.dfsg.1-1 [201kB]
Get:47 http://mirrors.kernel.org testing/main libxi6 4.3.0.dfsg.1-1 [147kB]
Get:48 http://mirrors.kernel.org testing/main libxt-dev 4.3.0.dfsg.1-1 [635kB]
Get:49 http://mirrors.kernel.org testing/main libxt6 4.3.0.dfsg.1-1 [312kB]
Get:50 http://mirrors.kernel.org testing/main libxmu-dev 4.3.0.dfsg.1-1 [197kB]
Get:51 http://mirrors.kernel.org testing/main libxmu6 4.3.0.dfsg.1-1 [181kB]
Get:52 http://mirrors.kernel.org testing/main libxmuu-dev 4.3.0.dfsg.1-1 [131kB]
Get:53 http://mirrors.kernel.org testing/main libxmuu1 4.3.0.dfsg.1-1 [138kB]
Get:54 http://mirrors.kernel.org testing/main libxp-dev 4.3.0.dfsg.1-1 [149kB]
Get:55 http://mirrors.kernel.org testing/main libxp6 4.3.0.dfsg.1-1 [147kB]
Get:56 http://mirrors.kernel.org testing/main libxpm-dev 4.3.0.dfsg.1-1 [166kB]
Get:57 http://mirrors.kernel.org testing/main libxpm4 4.3.0.dfsg.1-1 [165kB]   
Get:58 http://mirrors.kernel.org testing/main libxrandr-dev 4.3.0.dfsg.1-1 [138kB]
Get:59 http://mirrors.kernel.org testing/main libxrandr2 4.3.0.dfsg.1-1 [138kB]
Get:60 http://mirrors.kernel.org testing/main libxtrap-dev 4.3.0.dfsg.1-1 [154kB]
Get:61 http://mirrors.kernel.org testing/main libxtrap6 4.3.0.dfsg.1-1 [148kB] 
Get:62 http://mirrors.kernel.org testing/main libxtst-dev 4.3.0.dfsg.1-1 [139kB]
Get:63 http://mirrors.kernel.org testing/main libxtst6 4.3.0.dfsg.1-1 [141kB]  
Get:64 http://mirrors.kernel.org testing/main xlibs 4.3.0.dfsg.1-1 [374kB]     
Get:65 http://mirrors.kernel.org testing/main libkpathsea3 2.0.2-14 [62.1kB]   
Get:66 http://mirrors.kernel.org testing/main libpng12-dev 1.2.5.0-6 [257kB]   
Get:67 http://mirrors.kernel.org testing/main libpng12-0 1.2.5.0-6 [121kB]     
Get:68 http://mirrors.kernel.org testing/main gcc-3.3-base 1:3.3.3-6 [145kB]   
Get:69 http://mirrors.kernel.org testing/main libstdc++5 1:3.3.3-6 [357kB]     
Get:70 http://mirrors.kernel.org testing/main libt1-5 5.0.2-2 [173kB]          
Get:71 http://mirrors.kernel.org testing/main libxaw7 4.3.0.dfsg.1-1 [332kB]   
Get:72 http://mirrors.kernel.org testing/main tetex-bin 2.0.2-14 [4570kB]      
Get:73 http://mirrors.kernel.org testing/main vim-common 1:6.2-426+1 [3136kB]  
Get:74 http://mirrors.kernel.org testing/main vim 1:6.2-426+1 [864kB]          
Get:75 http://mirrors.kernel.org testing/main apt 0.5.25 [1070kB]              
Get:76 http://mirrors.kernel.org testing/main dselect 1.10.21 [116kB]          
Get:77 http://mirrors.kernel.org testing/main initscripts 2.85-15 [27.6kB]     
Get:78 http://mirrors.kernel.org testing/main libattr1 2.4.16-1 [8986B]        
Get:79 http://mirrors.kernel.org testing/main libblkid1 1.35-6 [40.4kB]        
Get:80 http://mirrors.kernel.org testing/main libcomerr2 1.35-6 [24.4kB]       
Get:81 http://mirrors.kernel.org testing/main libss2 1.35-6 [31.2kB]           
Get:82 http://mirrors.kernel.org testing/main libuuid1 1.35-6 [31.5kB]         
Get:83 http://mirrors.kernel.org testing/main sysv-rc 2.85-15 [33.5kB]         
Get:84 http://mirrors.kernel.org testing/main passwd 1:4.0.3-28.3 [507kB]      
Get:85 http://mirrors.kernel.org testing/main adduser 3.53 [89.5kB]            
Get:86 http://mirrors.kernel.org testing/main bsdmainutils 6.0.14 [182kB]      
Get:87 http://mirrors.kernel.org testing/main net-tools 1.60-10 [273kB]        
Get:88 http://mirrors.kernel.org testing/main ifupdown 0.6.4-4.8 [43.9kB]      
Get:89 http://mirrors.kernel.org testing/main iptables 1.2.9-9 [412kB]         
Get:90 http://mirrors.kernel.org testing/main libconsole 1:0.2.3dbs-52 [136kB] 
Get:91 http://mirrors.kernel.org testing/main libtasn1-0 0.1.2-2 [31.8kB]      
Get:92 http://mirrors.kernel.org testing/main libwrap0 7.6.dbs-3 [29.9kB]      
Get:93 http://mirrors.kernel.org testing/main man-db 2.4.2-16 [607kB]          
Get:94 http://mirrors.kernel.org testing/main tcpd 7.6.dbs-3 [72.2kB]          
Get:95 http://mirrors.kernel.org testing/main netbase 4.17 [39.6kB]            
Get:96 http://mirrors.kernel.org testing/main makedev 2.3.1-69 [39.6kB]        
Get:97 http://mirrors.kernel.org testing/main procps 1:3.2.1-2 [228kB]         
Get:98 http://mirrors.kernel.org testing/main bc 1.06-15 [69.8kB]              
Get:99 http://mirrors.kernel.org testing/main libisc7 1:9.2.3+9.2.4-rc2-1 [172kB]
Get:100 http://mirrors.kernel.org testing/main libssl0.9.7 0.9.7d-2 [716kB]    
Get:101 http://mirrors.kernel.org testing/main libdns11 1:9.2.3+9.2.4-rc2-1 [528kB]
Get:102 http://mirrors.kernel.org testing/main bind9-host 1:9.2.3+9.2.4-rc2-1 [91.5kB]
Get:103 http://mirrors.kernel.org testing/main binutils 2.14.90.0.7-6 [2478kB] 
Get:104 http://mirrors.kernel.org testing/main cpp-3.3 1:3.3.3-6 [1479kB]      
Get:105 http://mirrors.kernel.org testing/main dc 1.06-15 [60.3kB]             
Get:106 http://mirrors.kernel.org testing/main dictionaries-common 0.22.24 [149kB]
Get:107 http://mirrors.kernel.org testing/main liblwres1 1:9.2.3+9.2.4-rc2-1 [90.6kB]
Get:108 http://mirrors.kernel.org testing/main dnsutils 1:9.2.3+9.2.4-rc2-1 [160kB]
Get:109 http://mirrors.kernel.org testing/main doc-linux-text 2004.04-1 [8197kB]
Get:110 http://mirrors.kernel.org testing/main make 3.80-7 [439kB]             
Get:111 http://mirrors.kernel.org testing/main dpkg-dev 1.10.21 [137kB]        
Get:112 http://mirrors.kernel.org testing/main flex 2.5.31-24 [275kB]          
Get:113 http://mirrors.kernel.org testing/main gcc-3.3 1:3.3.3-6 [1569kB]      
Get:114 http://mirrors.kernel.org testing/main libstdc++5-3.3-dev 1:3.3.3-6 [894kB]
Get:115 http://mirrors.kernel.org testing/main g++-3.3 1:3.3.3-6 [1903kB]      
Get:116 http://mirrors.kernel.org testing/main gdb 6.1-2 [2644kB]              
Get:117 http://mirrors.kernel.org testing/main libdb4.0 4.0.14-1.4 [352kB]     
Get:118 http://mirrors.kernel.org testing/main python-newt 0.51.6-3 [36.2kB]   
Get:119 http://mirrors.kernel.org testing/main libnewt0.51 0.51.6-3 [61.0kB]   
Get:120 http://mirrors.kernel.org testing/main lsof 4.71-1 [324kB]             
Get:121 http://mirrors.kernel.org testing/main portmap 5-3 [23.7kB]            
Get:122 http://mirrors.kernel.org testing/main python2.3 2.3.3.91-1 [3172kB]   
Get:123 http://mirrors.kernel.org testing/main reportbug 2.60 [102kB]          
Get:124 http://mirrors.kernel.org testing/main ssh 1:3.8p1-3 [782kB]           
Get:125 http://mirrors.kernel.org testing/main strace 4.5.3-1 [89.6kB]         
Get:126 http://mirrors.kernel.org testing/main time 1.7-19 [34.5kB]            
Get:127 http://mirrors.kernel.org testing/main whiptail 0.51.6-3 [32.8kB]      
Get:128 http://mirrors.kernel.org testing/main whois 4.6.15 [40.0kB]           
Get:129 http://mirrors.kernel.org testing/main apt-utils 0.5.25 [224kB]        
Get:130 http://mirrors.kernel.org testing/main autotools-dev 20040312.1 [53.8kB]
Get:131 http://mirrors.kernel.org testing/main cvs 1:1.12.5-6 [1402kB]         
Get:132 http://mirrors.kernel.org testing/main cxref 1.5f-3 [306kB]            
Get:133 http://mirrors.kernel.org testing/main dbs 0.31 [22.4kB]               
Get:134 http://mirrors.kernel.org testing/main debconf-utils 1.4.25 [32.5kB]   
Get:135 http://mirrors.kernel.org testing/main intltool-debian 0.30+20040212 [23.4kB]
Get:136 http://mirrors.kernel.org testing/main po-debconf 0.8.11 [66.7kB]      
Get:137 http://mirrors.kernel.org testing/main debhelper 4.2.10 [353kB]        
Get:138 http://mirrors.kernel.org testing/main distcc 2.14-1 [150kB]           
Get:139 http://mirrors.kernel.org testing/main emacs21 21.3+1-5 [2156kB]       
Get:140 http://mirrors.kernel.org testing/main emacs21-common 21.3+1-5 [11.0MB]
Get:141 http://mirrors.kernel.org testing/main emacs21-bin-common 21.3+1-5 [155kB]
Get:142 http://mirrors.kernel.org testing/main libungif4g 4.1.0b1-6 [53.3kB]   
Get:143 http://mirrors.kernel.org testing/main fakeroot 0.9.5 [62.8kB]         
Get:144 http://mirrors.kernel.org testing/main initrd-tools 0.1.67 [25.5kB]    
Get:145 http://mirrors.kernel.org testing/main kernel-package 8.090 [299kB]    
Get:146 http://mirrors.kernel.org testing/main libdb3-util 3.2.9-19.1 [54.5kB] 
Get:147 http://mirrors.kernel.org testing/main libdps1 4.3.0.dfsg.1-1 [272kB]  
Get:148 http://mirrors.kernel.org testing/main libpng10-0 1.0.15-5 [119kB]     
Get:149 http://mirrors.kernel.org testing/main libpng2 1.0.15-5 [938B]         
Get:150 http://mirrors.kernel.org testing/main libtasn1-2 0.2.7-2 [45.8kB]     
Get:151 http://mirrors.kernel.org testing/main libtool 1.5.6-1 [626kB]         
Get:152 http://mirrors.kernel.org testing/main libxcursor-dev 1.1.3-1 [35.2kB] 
Get:153 http://mirrors.kernel.org testing/main libxcursor1 1.1.3-1 [27.4kB]    
Get:154 http://mirrors.kernel.org testing/main libxv-dev 4.3.0.dfsg.1-1 [159kB]
Get:155 http://mirrors.kernel.org testing/main libxv1 4.3.0.dfsg.1-1 [139kB]   
Get:156 http://mirrors.kernel.org testing/main module-init-tools 3.0-pre10-3 [72.6kB]
Get:157 http://mirrors.kernel.org testing/main ntpdate 1:4.2.0a-8 [175kB]      
Get:158 http://mirrors.kernel.org testing/main palo 1.5 [49.3kB]               
Get:159 http://mirrors.kernel.org testing/main pciutils 1:2.1.11-8 [133kB]     
Get:160 http://mirrors.kernel.org testing/main pm-dev 4.3.0.dfsg.1-1 [126kB]   
Get:161 http://mirrors.kernel.org testing/main ppp 2.4.2+20040202-3 [310kB]    
Get:162 http://mirrors.kernel.org testing/main pppconfig 2.3.1 [30.5kB]        
Get:163 http://mirrors.kernel.org testing/main pppoeconf 1.0.1 [25.9kB]        
Get:164 http://mirrors.kernel.org testing/main proftpd 1.2.9-12 [354kB]        
Get:165 http://mirrors.kernel.org testing/main proftpd-common 1.2.9-12 [144kB] 
Get:166 http://mirrors.kernel.org testing/main rsync 2.6.2-1 [176kB]           
Get:167 http://mirrors.kernel.org testing/main scsitools 0.7-1 [124kB]         
Get:168 http://mirrors.kernel.org testing/main tasksel 1.51 [172kB]            
Get:169 http://mirrors.kernel.org testing/main xlibmesa-gl 4.3.0.dfsg.1-1 [304kB]
Get:170 http://mirrors.kernel.org testing/main xlibmesa-glu 4.3.0.dfsg.1-1 [369kB]
Get:171 http://mirrors.kernel.org testing/main xbase-clients 4.3.0.dfsg.1-1 [2073kB]
Get:172 http://mirrors.kernel.org testing/main xlibs-static-dev 4.3.0.dfsg.1-1 [922kB]
Get:173 http://mirrors.kernel.org testing/main xterm 4.3.0.dfsg.1-1 [619kB]    
Get:174 http://mirrors.kernel.org testing/main exim 3.36-11 [810kB]            
Get:175 http://mirrors.kernel.org testing/main hddtemp 0.3-beta11-10 [40.2kB]  
Get:176 http://mirrors.kernel.org testing/main xlibs-dev 4.3.0.dfsg.1-1 [125kB]
Fetched 108MB in 16s (6421kB/s)                                                
Preconfiguring packages ...
(Reading database ... 38733 files and directories currently installed.)
Preparing to replace base-files 3.0.14 (using .../base-files_3.0.15_hppa.deb) ...
Unpacking replacement base-files ...
Setting up base-files (3.0.15) ...

(Reading database ... 38733 files and directories currently installed.)
Preparing to replace bash 2.05b-14 (using .../bash_2.05b-15_hppa.deb) ...
Unpacking replacement bash ...
Setting up bash (2.05b-15) ...
Installing new version of config file /etc/skel/.bashrc ...
Installing new version of config file /etc/skel/.bash_profile ...
Installing new version of config file /etc/bash.bashrc ...
Installing new version of config file /etc/bash_completion ...

(Reading database ... 38739 files and directories currently installed.)
Preparing to replace debianutils 2.8.1 (using .../debianutils_2.8.2_hppa.deb) ...
Unpacking replacement debianutils ...
Setting up debianutils (2.8.2) ...

(Reading database ... 38739 files and directories currently installed.)
Preparing to replace dpkg 1.10.20 (using .../archives/dpkg_1.10.21_hppa.deb) ...
Unpacking replacement dpkg ...
Setting up dpkg (1.10.21) ...

(Reading database ... 38741 files and directories currently installed.)
Preparing to replace libc6-dev 2.3.2.ds1-11 (using .../libc6-dev_2.3.2.ds1-12_hppa.deb) ...
Unpacking replacement libc6-dev ...
Preparing to replace debconf-i18n 1.4.16 (using .../debconf-i18n_1.4.25_all.deb) ...
Unpacking replacement debconf-i18n ...
Preparing to replace debconf 1.4.16 (using .../debconf_1.4.25_all.deb) ...
Unpacking replacement debconf ...
Preparing to replace locales 2.3.2.ds1-11 (using .../locales_2.3.2.ds1-12_all.deb) ...
Unpacking replacement locales ...
Preparing to replace libc6 2.3.2.ds1-11 (using .../libc6_2.3.2.ds1-12_hppa.deb) ...
Unpacking replacement libc6 ...
dpkg (subprocess): failed to exec rm for cleanup: No such file or directory
dpkg: error while cleaning up:
 subprocess rm cleanup returned error exit status 2
Could not exec dpkg!
E: Sub-process /usr/bin/dpkg returned an error code (100)
Some errors occurred while unpacking. I'm going to configure the
packages that were installed. This may result in duplicate errors
or errors caused by missing dependencies. This is OK, only the errors
above this message are important. Please fix them and run [I]nstall again
Press enter to continue.

/usr/lib/dpkg/methods/apt/install: line 105: /usr/bin/dpkg: No such file or directory

installation script returned error exit status 100.
Press <enter> to continue.

dselect (subprocess): unable to run installation script process `/usr/lib/dpkg/methods/apt/install': No such file or directory

installation script returned error exit status 2.
Press <enter> to continue.

ion:~# 



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
