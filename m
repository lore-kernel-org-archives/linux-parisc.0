Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 4 Jul 2003 13:28:37 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] binutils_2.14.90 bug
Message-ID: <20030704192837.GC7885@dsl2.external.hp.com>
References: <20030704191042.GB7885@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030704191042.GB7885@dsl2.external.hp.com>
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

On Fri, Jul 04, 2003 at 01:10:42PM -0600, Grant Grundler wrote:
...
> Older binutils*_2.12.90.0.1-4_hppa.deb works.

But I now have a dependency problem that dselect flagged:

binutils suggests binutils-doc (= 2.12.90.0.1-4)
gcc-3.3 depends on binutils (>= 2.13.90.0.10)
gcc-3.2 depends on binutils (>= 2.13.90.0.10)

I didn't see binutils*2.13.90.0.10_hppa.deb in the debian pool.
*sigh*

grant
