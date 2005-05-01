From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Sun, 01 May 2005 14:26:57 +0000
Message-ID: <4274E731.6080207@tiscali.be>
References: <200504281752.j3SHqBeE005408@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504281752.j3SHqBeE005408@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dave, Grant,

John David Anglin wrote:
>>mmm is there importance in the order of:
>>	.align 128
>>	.text
>>rfi_virt2real:
> 
> 
> Yes, put the .align after the .text.  You want to align the following
> text.
> 
Here is the patch so:
--- arch/parisc/kernel/real2.S.Orig     2005-01-08 16:58:49.000000000 +0100
+++ arch/parisc/kernel/real2.S  2005-05-01 15:45:32.000000000 +0200
@@ -143,8 +143,8 @@
  /* rfi_virt2real() and rfi_real2virt() could perhaps be adapted for
   * more general-purpose use by the several places which need RFIs
   */
-       .align 128
         .text
+       .align 128
  rfi_virt2real:
         /* switch to real mode... */
         ssm             0,0             /* See "relied upon translation" */
====<>====

Thanks to ci for me,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
