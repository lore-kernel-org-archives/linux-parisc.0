From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] SCSI (?) bug
Date: Sat, 06 Jan 2007 09:13:27 -0600
Message-ID: <1168096408.2792.46.camel__6289.7705859088$1416624254$gmane$org@mulgrave.il.steeleye.com>
References: <7d01f9f00701060522p5b52fe47m290cad4fd0aadf1c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701060522p5b52fe47m290cad4fd0aadf1c@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-01-06 at 14:22 +0100, Thibaut VARENE wrote:
> So the scsi bug that struck Jeff, Kyle and myself on A500 eventually
> killed my rp3440. Here's the console dump:

> http://www.pateam.org/archive/dumps/scsibug.txt

The log isn't really helpful ... what ever caused this occurred just
prior to the first line (if it's captured in the log at all).

> It basically renders SMP boxes useless. The last unaffected kernel was
> 2.6.18-rc1-pa3.

The symptoms make it appear like a lost interrupt but there are many
other possibilities.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
