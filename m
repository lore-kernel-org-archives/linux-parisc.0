Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cobra.winshop.com.au (cobra.winshop.com.au [203.22.127.31])
	by dsl2.external.hp.com (Postfix) with SMTP id A9D5D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 02:09:40 -0600 (MDT)
From: Robert Stanford <rotapile@winshop.com.au>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 24 May 2002 18:09:33 +1000
Message-Id: <1022227775.12724.9.camel@rotapile>
Mime-Version: 1.0
Subject: [parisc-linux] Debian install on K580
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

After installing the base system (woody) and rebooting, the base config
starts. Everything works fine till I get up to apt configuration. I
choose no to the below question and the error shown appears and ths
colsole (PDC) stops responding. I can still ping the box though.


Use security updates from security.debian.org?  
                                                                   . 
              <Yes>            <No>                      . 

apt-cache(429): unaligned access to 0x403d708c at ip=0x400614f7


I've had to netboot the machine with a custom kernel (2.4.18 from
parisc-linux.org) which I built with the cross compiler and mounted the
root.bin image via nfs to start the install. After that I completed the
install with the 0.9.3 CD , all due to the PDC console :) 

Regards
Robert Stanford
