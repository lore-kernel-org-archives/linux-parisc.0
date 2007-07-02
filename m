From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Mon, 2 Jul 2007 17:28:17 -0400 (EDT)
Message-ID: <200707022128.l62LSHVo028664__29346.4954862886$1416624406$gmane$org@hiauly1.hia.nrc.ca>
References: <46895C9F.7020000@frankengul.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: seb@frankengul.org (=?ISO-8859-1?Q?S=E9bastien_Bernard?=)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46895C9F.7020000@frankengul.org> from
	"=?ISO-8859-1?Q?S=E9bastien_Bernard?=" at Jul 2, 2007 10:14:23 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Matthias Klose a écrit :
> > The proposed fix seems to be wrong, as it disables the backport on all
> > architectures.  Please could you recheck with current trunk? As jda
> > suggested, another backport is missing for hppa.

Looking at this some more, I don't think there's a missing backport for hppa.

> There was no reaction on either site.

The comment was too vague and will be ignored since you are modifying
the gcc tree.  If a gcc bug is identified, then a new gcc PR is needed.

Looking at http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=428509,
I don't see that gcc is doing anything wrong.  Currently, I see the
following with readelf for __librt_multiple_threads in librt-2.5.so
and libc-2.5.so on testing, respectively:

    44: 00000000     4 OBJECT  GLOBAL DEFAULT  UND __librt_multiple_threads@GLIBC_PRIVATE (10)

  1230: 0013e328     4 OBJECT  GLOBAL DEFAULT   32 __librt_multiple_threads@@GLIBC_PRIVATE

The link error suggests that __librt_multiple_threads is hidden in libc-2.5.so.
This will only occur if the symbol is defined with the .hidden attribute.
If that's the case, the link error is expected.  So, either the symbol
shouldn't be hidden or it needs to be defined in librt as well.  This is
a glibc issue.

I should note that pa gcc backend doesn't do anything special wrt
.hidden.  .hidden support is handled completely by the middle-end.
Thus, any problem wrt .hidden in gcc is likely to apply to all targets
that support this attribute.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
