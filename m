Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 3 Jun 2003 17:59:13 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Joel Soete <jsoe0708@tiscali.be>, joel.soete@tiscali.be,
	xam@cs.ucc.ie, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] compiler & kernel
Message-ID: <20030603235913.GA3536@dsl2.external.hp.com>
References: <3ED70CF100001190@ocpmta2.freegates.net> <200306031418.h53EI399028101@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200306031418.h53EI399028101@hiauly1.hia.nrc.ca>
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

On Tue, Jun 03, 2003 at 10:18:03AM -0400, John David Anglin wrote:
> ...but the use of static binaries under 64-bit hpux is discouraged.

That depends on who you talk to.

The library maintainers cring at the thought of an application
statically linked and forever carrying around bugs in it.

But the perf folks get annoyed that each process has to allocate
RAM for *all* the data space used by a shared lib vs just for
the parts that get linked in statically. (I hope I remember this
correctly).

grant
