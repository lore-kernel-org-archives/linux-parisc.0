From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: [parisc-linux] Is the message from 'make modules_install' important?
Date: Sun, 03 Jul 2005 12:45:29 +0800
Message-ID: <5.1.1.6.1.20050703124208.02a57290__49438.9124018655$1416623829$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
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

Hi,

Just wonder, every time I run 'make modules_install' in Linux 
2.6.12-rc6-pa1 it always ended with the following line:

if [ -r System.map -a -x /sbin/depmod ]; then /sbin/depmod -ae -F 
System.map  2.
6.12-rc6-pa1; fi


Did the 'make modules_install' complete its task or it stopped prematurely? 
Pls adv.


Thanks,
Lee


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
