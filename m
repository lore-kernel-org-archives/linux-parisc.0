Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James Mcclain <jmccla3@gl.umbc.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64-bit pa20, pa24 fail to boot on my c200 
In-Reply-To: Message from James Mcclain <jmccla3@gl.umbc.edu>
   of "Wed, 26 Dec 2001 12:29:04 EST." <Pine.LNX.4.31L.02.0112261221590.5356-100000@linux1.gl.umbc.edu>
References: <Pine.LNX.4.31L.02.0112261221590.5356-100000@linux1.gl.umbc.edu> 
Date: Wed, 26 Dec 2001 11:21:01 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011226182102.52C76483F@dsl2.external.hp.com>
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

James Mcclain wrote:
> my machine fails to boot with a 64-bit kernel (either downloaded
> from the website or built by me).

See the mail archives at http://lists.parisc-linux.org.
Search for C200, CONFIG_PDC_NARROW, or 64-bit.

Short anwser is you need to define CONFIG_PDC_NARROW for 64-bit.

grant
