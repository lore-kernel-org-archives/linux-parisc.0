Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Jun 2003 10:36:01 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] byte swapping redux
Message-ID: <20030630163601.GC14971@dsl2.external.hp.com>
References: <3ED70CF10000BCAA@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED70CF10000BCAA@ocpmta2.freegates.net>
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

On Mon, Jun 30, 2003 at 04:58:01PM +0200, Joel Soete wrote:
> I don't understand why the 32bits kernel crashed with this patche:
> (gcc-3.3 and binutils-2.13.90)

uhm...perhaps the 64-bit swap is buggy for 32-bit mode?
I didn't test that. It's a different code path.

> the log of the boot sequence shows me that the kernel was launched twice:

probably not. It's probably the kernel crash path just dumping out
the dmesg buffer "again".

grant
