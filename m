From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] www.parisc-linux.org crashed
Date: 16 Jul 2004 08:59:48 -0500
Message-ID: <1089986393.2098.20.camel@mulgrave>
References: <20040716031951.GB27175@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040716031951.GB27175@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2004-07-15 at 22:19, Grant Grundler wrote:
> Hi,
> www.parisc-linux.org crashed earlier today running a 2.4.25 kernel.
> I happened to be around and recovered the console.
> Appended below in case someone wanted to poke at it a bit or can
> tell me this is a known problem.

It looks like a usual ext3 panic precipitated by a disc I/O error.  What
were the SCSI logs before this?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
