From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PATCH hppa ordered load absolute ops
Date: Fri, 31 Jan 2003 11:11:26 -0500 (EST)
Message-ID: <200301311611.h0VGBQiC020120__29261.7034669549$1416622170$gmane$org@hiauly1.hia.nrc.ca>
References: <20030131070155.8DDFD482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: bug-binutils@gnu.org, parisc-linux@lists.parisc-linux.org
To: grundler@dsl2.external.hp.com (Grant Grundler)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030131070155.8DDFD482A@dsl2.external.hp.com> from "Grant Grundler" at Jan 31, 2003 00:01:55 am
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant,

>  { "ldwa",       0x0c000180, 0xfc00d3c0, "cxccx(b),t", pa10, FLAG_STRICT},
>  { "ldwa",	0x0c001180, 0xfc00d3c0, "cmcc5(b),t", pa10, FLAG_STRICT},
> +{ "ldwa",	0x0c0031a0, 0xfc1ff3d0, "cocc@(b),t", pa20, FLAG_STRICT},

?               0x0c0011a0, 0xfc1ff3e0 

>  { "ldda",       0x0c000100, 0xfc00d3c0, "cxccx(b),t", pa20, FLAG_STRICT},
>  { "ldda",	0x0c001100, 0xfc00d3c0, "cmcc5(b),t", pa20, FLAG_STRICT},
> +{ "ldda",	0x0c003100, 0xfc1ff3d0, "cocc@(b),t", pa20, FLAG_STRICT},

?		0x0c001120, 0xfc1ff3e0

Shouldn't a=0, m=1 and im5=0?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
