From: dann frazier <dannf@hp.com>
Subject: [parisc-linux] paer.debian.org crash in ext3_write_inode()
Date: Thu, 04 Aug 2005 19:17:18 -0600
Message-ID: <1123204638.3628.132.camel@krebs.dannf>
Mime-Version: 1.0
Content-Type: text/plain
To: parisc-linux@lists.parisc-linux.org
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

fyi, paer.debian.org was reported down.  The GSP's console log
follows.  

dannf@paer:~$ uname -a
Linux paer 2.6.8-2-64 #1 Tue Feb 8 05:54:00 EST 2005 parisc64 GNU/Linux


GSP> cl


CL

<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:


Press Q/q to quit, Enter to continue:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]

Backtrace:
 [<00000000101164d8>] dump_stack+0x18/0x28
 [<000000000012b024>] ext3_write_inode+0x3c/0x68 [ext3]





_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
