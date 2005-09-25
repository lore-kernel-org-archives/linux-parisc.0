From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Space registers and how to use them
Date: Sun, 25 Sep 2005 12:17:56 -0600
Message-ID: <20050925181756.GD1459@parisc-linux.org>
References: <20050925034342.GA1459@parisc-linux.org>
	<200509251743.j8PHhw4w013823@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509251743.j8PHhw4w013823@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 25, 2005 at 01:43:58PM -0400, John David Anglin wrote:
> As a coding note, it's best not to specify sr0 in instructions which
> use the base register selection mechanism.

I'd be happiest if it were illegal actually.  I wonder how much code
that'd break though ...

Can we make it emit a warning?  Something like
"sr0 not allowed for this instruction, using short pointer addressing instead"
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
