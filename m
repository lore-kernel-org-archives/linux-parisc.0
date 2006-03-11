From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sun, 12 Mar 2006 00:28:58 +0800
Message-ID: <4412FACA.2010102__3856.6583571539$1416624585$gmane$org@tausq.org>
References: <200602220005.k1M05o1D006305@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200602220005.k1M05o1D006305@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The reason for the segmentation fault is the R_PARISC_IPLT isn't
> being handled correctly and the indirect call to the constructor
> for the library branches to the wrong location.

here's what i see....

__do_global_ctors_aux is trying to load a value from the GOT
(__CTORS_LIST i think). I'm seeing that it loads some garbage value
(0x4fd23f01 in my case), and then it tries to do a $dyncall on that.

__do_global_ctors_aux does something like:

addil 0(%r19),%r1
ldw 28(%r1),%ret0
ldw -4(%ret0),%r3
...
copy %r3,%r22
b,l $$dyncall, %r31

$r19+0x28 is 0x41896830; points inside the .plt. seems reasonable

but *(%ret0-4) points inside the text section, so r22 eventually gets 
loaded with an instruction value (0x4fd23f01 == ldw,mb -80(sp),r18)

dunno if this helps with anything... have to think about it somemore to 
see what's happening...

randolph


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
