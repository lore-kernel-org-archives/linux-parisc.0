From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Sat, 6 Jan 2007 12:43:34 +0100
Message-ID: <7d01f9f00701060343q4dea6067yd59df5a65fe35dc2__32909.4825931408$1416624253$gmane$org@mail.gmail.com>
References: <7d01f9f00701051834l4766fe0aya242c808bffbc407@mail.gmail.com>
	<5b2e36650701052010t6e196fdl1d413e6bed223ccc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Jeff Bailey" <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650701052010t6e196fdl1d413e6bed223ccc@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 1/6/07, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> On 05/01/07, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> > As a side note, I just killed again that very same box trying to build
> > a kernel: disk was put offline after scsi reset or something (couldn't
> > gather more data at this point, will do that tomorrow. IIRC kyle is
> > experiencing that same bug though).
>
> The SCSI problems you're having went away for me when I put it on a UP kernel.

OK, that means that's a SMP issue then. I'm sure you don't mean the
fix is to use a UP kernel? 8^)

Will dig that more today.

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
