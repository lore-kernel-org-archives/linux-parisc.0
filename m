Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA07017
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 12:35:20 -0600
Message-Id: <199906211835.OAA14539@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problems with createheader.sh script
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 21 Jun 1999 14:35:16 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199906211756.NAA10393@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 21, 99 01:56:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> When creating a LIF image, i get the following errors:
> 
> ./boot_tools/createheader.sh boot_code/ipl ../../../../vmlinux
> ./boot_tools/createheader.sh: !: not found
> ./boot_tools/createheader.sh: !: not found
> (standard_in) 1: illegal character: J
> (standard_in) 1: parse error
> (standard_in) 1: parse error
> (standard_in) 1: parse error
> (standard_in) 1: illegal character: J
> IPL address: 4096       kernel address: 49152
> IPL size:  45056 Jun    kernel size:
> IPL entry: 4096         kernel entry: 32768
> Header created.

Here is a patch which fixes the above problems.  Note--there are still
issues related to the kernel parameters which need to be resolved.

I also recommend stripping the kernel after the map is generated to
reduce the size of the Image.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

*** createheader.sh.orig	Fri Jun 18 09:09:53 1999
--- createheader.sh	Mon Jun 21 14:26:19 1999
***************
*** 12,38 ****
  
  if [ $# != 2 ]; then
  	echo "Usage: createheader.sh ipl vmlinux"
  fi
  
! if ! [ -e ${ipl} ]; then
  	echo "Cannot open ${ipl}"
          exit 1
  fi
  
! if ! [ -e ${vmlinux} ]; then
  	echo "Cannot open ${vmlinux}"
          exit 1
  fi
  
  i_addr=4096
  
! if [ $arch = Linux ] ; then
! 	i_size=`ls -l ${ipl} |cut -c 36-42`
! 	k_size_initial=`ls -l ${vmlinux} |cut -c 36-42`
! elif [ $arch = HP-UX ]; then
!         i_size=`ls -l ${ipl} |cut -c 36-45`
! 	k_size_initial=`ls -l ${vmlinux} |cut -c 36-45`
! fi
  
  i_entry=4096
  k_addr=49152
--- 12,34 ----
  
  if [ $# != 2 ]; then
  	echo "Usage: createheader.sh ipl vmlinux"
+         exit 1
  fi
  
! if [ ! -r ${ipl} ]; then
  	echo "Cannot open ${ipl}"
          exit 1
  fi
  
! if [ ! -r ${vmlinux} ]; then
  	echo "Cannot open ${vmlinux}"
          exit 1
  fi
  
  i_addr=4096
  
! i_size=`ls -l ${ipl} |awk '{print $5}'`
! k_size_initial=`ls -l ${vmlinux} |awk '{print $5}'`
  
  i_entry=4096
  k_addr=49152
***************
*** 41,47 ****
  k_entry=32768
  
  echo "IPL address: ${i_addr}\tkernel address: ${k_addr} "
! echo "IPL size: ${i_size}\tkernel size: ${k_size} "
  echo "IPL entry: ${i_entry} \tkernel entry: ${k_entry}"
  ./boot_tools/mklifhdr hdr ${i_addr} ${i_size} ${i_entry} \
     ${k_addr} ${k_size} ${k_entry}
--- 37,43 ----
  k_entry=32768
  
  echo "IPL address: ${i_addr}\tkernel address: ${k_addr} "
! echo "IPL size: ${i_size}\t\tkernel size: ${k_size} "
  echo "IPL entry: ${i_entry} \tkernel entry: ${k_entry}"
  ./boot_tools/mklifhdr hdr ${i_addr} ${i_size} ${i_entry} \
     ${k_addr} ${k_size} ${k_entry}
