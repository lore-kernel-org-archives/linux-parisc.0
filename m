Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 26 Sep 2003 10:41:39 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Cc: mlist@zinkens.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel error message.
Message-ID: <20030926164139.GA11759@dsl2.external.hp.com>
References: <35989.192.168.66.99.1064533174.squirrel@www.zinkens.net> <20030926070329.GA12671@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030926070329.GA12671@tausq.org>
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

On Fri, Sep 26, 2003 at 12:03:29AM -0700, Randolph Chung wrote:
> Your apache is crashing randomly :( I think mkp said he was seeing this
> problem as well and was trying to debug it.

I haven't been seeing that with either apache or apache2.

On a500 (64-bit, 2.4.21-pa6) running testing:
ii  apache         1.3.27.0-2     Versatile, high-performance HTTP server

On c3k (32-bit, 2.4.22-pa7) running testing:
ii  apache2-common 2.0.47-1       Next generation, scalable, extendable web se
ii  apache2-mpm-pr 2.0.47-1       Traditional model for Apache2

Neither is heavily loaded but can see bursts of load at times.

hth,
grant
