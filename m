Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70C3248C9
	for <parisc-linux@parisc-linux.org>; Sun,  4 Aug 2002 12:09:57 -0600 (MDT)
Message-ID: <3D4D7AF8.9030005@freebel.net>
Date: Sun, 04 Aug 2002 19:05:28 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: bame@fc.hp.com, parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Palo: cmdline and commanline has different limits?
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

Hi Paul,

I just notice a small problem:

In palo/palo/palo.c at line 720:
	...
	if (strlen(commandline) > 255)
	...

OTC in palo/lib/common.h in struct firstblock at line 46:

     char cmdline[128];          /* Up to 127 bytes of text plus a \0 */

     unsigned char pad1[0xf0 - 8 - 7 * sizeof (int) - 128];


I do not know yet if pad1 can be removed so that cmdline could reach 204 
[240-8-7*(sizeof int = 4?)] char lenght, also I prefer to let you choise.

Joel
