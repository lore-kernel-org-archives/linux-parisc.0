From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] linux32 personality & config.guess
Date: Thu, 6 Sep 2007 16:33:00 -0400 (EDT)
Message-ID: <200709062033.l86KX19p000952__44933.3012490117$1416624436$gmane$org@hiauly1.hia.nrc.ca>
References: <7d01f9f00709061215q721df5b4wa7b8a0b96eaf491@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: varenet@gmail.com (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00709061215q721df5b4wa7b8a0b96eaf491@mail.gmail.com> from
	"Thibaut VARENE" at Sep 6, 2007 09:15:48 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Seems you misunderstood jda's above comment. We do not have a 64bit
> userland on hppa. the 'hppa64' part of the target string represents
> the architecture of the /kernel/. 64bit kernels run a 32bit userland,
> hence hppa64-linux should be treated (so far) as hppa-linux.

No, the architecture portion of the string in the PA case doesn't
simply represent the architecture of the kernel.  In the hpux case,
hppa2.0w and hppa64 both indicate a wide PA 2.0 kernel.  As noted
in the previous message, config.guess selects between the two based
on the setting of CC.

This has arisen on the PA since we have separate 32 and 64 bit tools.
In other architectures, a compiler flag is used to select the output
architecture.

Although we don't have a 64-bit userland in linux, we do have 64-bit
compilation tools for kernel generation.  To build these, you need
to specify a hppa64-linux target.  For this reason, we don't treat
hppa64-linux as equivalent to hppa-linux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
