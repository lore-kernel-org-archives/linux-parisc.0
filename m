Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postix.nrpa.no (proxy.nrpa.no [193.217.14.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8FF8482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 05:12:12 -0700 (MST)
Message-ID: <54DE9A561AD20C4D9FF88B116965420E4E5EA9@postix.nrpa.no>
From: Morten Sickel <Morten.Sickel@nrpa.no>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 11 Mar 2003 13:10:28 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] newbie which HP-UX binaries
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

I have an old HP712/80 box running 10.20 that I am thinking about running
linux on. The only problem is that I have to run an old (7.1) Esri arc/info
on the machine. I have seen in the faq that:

"We intend to support 4 binary formats: 
HP/UX SOM 32 bit
Linux ELF 32 bit
HP/UX ELF 64 bit
Linux ELF 64 bit
" 

But I have to admit that it does not help me too much, as:

[cesium:download]$ file /usr/local/arcexe71/bin/arc  
/usr/local/arcexe71/bin/arc:    PA-RISC1.1 shared executable dynamically
linked

is this the same as SOM 32 bit?

After digging around in the mailing list archives, it is also not clear to
me if I can read the existing disks on my WS. It would make the transistion
easier, or I could install linux on a spare disk, boot from that and test if
it works.

I also need to run the flexlm licence manager. Does anybody know if that
works, and if the ids that are used there still are valid under linux.

(yes, I know about grass, and I am in fact using it under i386 linux, but
for backward compatibility, I would prefer to still have arc/info around)

regards,
-- 
Morten Sickel
Norwegian Radiation Protection Authority
http://www.nrpa.no 
