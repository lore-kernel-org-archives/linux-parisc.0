From: Bartlomiej Ochman <fback@fback.net>
Subject: [parisc-linux] xfs in unusable with pa-linux 2.6.8?
Date: Thu, 09 Sep 2004 13:37:02 +0200
Message-ID: <4140405E.4070202@fback.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: PARISC Linux <parisc-linux@lists.parisc-linux.org>
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

Hello.

Can anybody confirm this? It happens after reboot nearly every time, but 
also after some time using this fs. The result is different from time to 
time, sometimes kernel crashes with some backtrace (unfortunately I 
don't have xfs anymore, and it would be difficult to get one now, since 
I've moved back to ext2 already), sometimes it oopses with message 
saying the filesystem is not xfs after reboot. After repairing with 
xfs_repair most of the filesystem lands in lost+found and the filesystem 
is generally not usable anymore. I thought it's sync-related, but I'm 
not sure now, sync; sync; sync; reboot commands does not solve the problem.

I'll try to make some unimportatnt "partition" later, and send you more 
detailed report.

Regards,
BO
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
