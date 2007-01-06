From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] SCSI (?) bug
Date: Sat, 6 Jan 2007 16:27:57 +0100
Message-ID: <7d01f9f00701060727n421209a6q14c5f99ae798416e__27680.2204120488$1416624254$gmane$org@mail.gmail.com>
References: <7d01f9f00701060522p5b52fe47m290cad4fd0aadf1c@mail.gmail.com>
	<1168096408.2792.46.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1168096408.2792.46.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 1/6/07, James Bottomley <James.Bottomley@steeleye.com> wrote:
> On Sat, 2007-01-06 at 14:22 +0100, Thibaut VARENE wrote:
> > So the scsi bug that struck Jeff, Kyle and myself on A500 eventually
> > killed my rp3440. Here's the console dump:
>
> > http://www.pateam.org/archive/dumps/scsibug.txt
>
> The log isn't really helpful ... what ever caused this occurred just
> prior to the first line (if it's captured in the log at all).

There was nothing prior to the first line (except the last normal
dmesg output from boot time)

> > It basically renders SMP boxes useless. The last unaffected kernel was
> > 2.6.18-rc1-pa3.
>
> The symptoms make it appear like a lost interrupt but there are many
> other possibilities.

OK, thanks for the hint. It doesn't happen at all on UP machines, afaict.

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
