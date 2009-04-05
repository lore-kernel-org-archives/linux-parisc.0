From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] Remove casts from atomic macros
Date: Sat, 4 Apr 2009 22:56:58 -0400
Message-ID: <20090405025658.GB17936@bombadil.infradead.org>
References: <20090404205426.GA27225@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Bastian Blank <waldi@debian.org>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090404205426.GA27225@wavehammer.waldi.eu.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 04, 2009 at 10:54:26PM +0200, Bastian Blank wrote:
> The atomic operations on parisc are defined as macros. The macros
> includes casts which disallows the use of some syntax elements and
> produces error like this:
> 
> net/phonet/pep.c: In function 'pipe_rcv_status':
> net/phonet/pep.c:262: error: lvalue required as left operand of assignment
> 
> The patch removes this superfluous casts.
> 
> Signed-off-by: Bastian Blank <waldi@debian.org>
> 

Applied. Thanks.
(Man that phonet thing is stupid code though...)

cheers, Kyle
