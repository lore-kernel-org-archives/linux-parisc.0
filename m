Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Miles, John" <John.Miles@uk.ngrid.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xf86 & PEX fonts 
In-Reply-To: Message from "Miles, John" <John.Miles@uk.ngrid.com>
   of "Mon, 31 Dec 2001 14:19:49 GMT." <D3B55643A649D31188A30008C7BB744E0193A7B8@WOKHEX01>
References: <D3B55643A649D31188A30008C7BB744E0193A7B8@WOKHEX01> 
Date: Mon, 31 Dec 2001 10:54:49 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011231175449.196F54833@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"Miles, John" wrote:
> How can I get rid of  this error OR can somebody give me a working
> XF86Config file??

apt-get install xfonts-pex

XF86Config files are always a PITA because they contain too much detail
that can't be detected. I think most of the info is by now in the mail
archive if someone has time to consolidate it into a HOW-TO.
(eg define screen resolution as returned by "fbset -i").

grant
