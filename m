Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 10 Dec 2002 12:24:12 -0700
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SMP on kernel version 19 pa 23
Message-ID: <20021210192412.GB16933@dsl2.external.hp.com>
References: <9A0482A7BD2506488AD9417C93F3714FB4ABC3@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714FB4ABC3@xsp01.brazil.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Dec 10, 2002 at 10:41:00AM -0800, FARINATI,LEANDRO wrote:
> 	I would link to know if the SMP is working on kernel 19 pa 23, 32
> bits?

I assume you mean 2.4.19-pa23.
IIRC 2.4.19-pa24 booted/worked on a500 (64-bit) and I thought that was
an SMP kernel but aren't sure now.

> 	I'm make this question because when I enable SMP to compile this
> kernel and put it to run, it crashes when the systen try do boot.

can you post the console output?
And you .config file? (if it's not the default)

grant
