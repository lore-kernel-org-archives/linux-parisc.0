From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: Re: [parisc-linux] PATCH hppa ordered load absolute ops
Date: Fri, 31 Jan 2003 12:18:45 -0700
Message-ID: <20030131191845.GA30799__36626.5836557888$1416622171$gmane$org@dsl2.external.hp.com>
References: <20030131070155.8DDFD482A@dsl2.external.hp.com> <200301311611.h0VGBQiC020120@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: bug-binutils@gnu.org, parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200301311611.h0VGBQiC020120@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Jan 31, 2003 at 11:11:26AM -0500, John David Anglin wrote:
> > +{ "ldda",	0x0c003100, 0xfc1ff3d0, "cocc@(b),t", pa20, FLAG_STRICT},
> ?		0x0c001120, 0xfc1ff3e0
> 
> Shouldn't a=0, m=1 and im5=0?

yes - I thought I did that.
I laid out the bits on paper and then converted to hex.
I'll review tonight but trust you can get them right :^)

thanks,
grant
