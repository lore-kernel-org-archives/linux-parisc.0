Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 881B54841
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Nov 2003 13:01:05 -0700 (MST)
Received: from hrzpub.tu-darmstadt.de (IP-213157011231.dialin.heagmedianet.de [213.157.11.231])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.10/8.12.7) with ESMTP id hA5K0RCT004357
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Nov 2003 21:00:34 +0100
Message-ID: <3FA956FD.4080901@hrzpub.tu-darmstadt.de>
Date: Wed, 05 Nov 2003 21:01:01 +0100
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Unresolved symbols in 2.4.22-pa13
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

Hi there,

when compiling the parport driver as a module, I get an unresolved 
symbols error:
-----><--------
find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} pcmcia
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.22-pa13; fi
depmod: *** Unresolved symbols in 
/lib/modules/2.4.22-pa13/kernel/drivers/parport/parport_pc.o
depmod:         outsb
depmod:         outsl
depmod:         insb
depmod:         insl
-----><--------
Can s.b. with CVS access add the necessary export symbol lines to 
parport_pc?

Greetings,
    Ruediger
