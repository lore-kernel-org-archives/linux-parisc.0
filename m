Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 22 May 2003 10:23:46 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, drepper@redhat.com,
	libc-alpha@sources.redhat.com, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
Subject: Re: [parisc-linux] Re: [PATCH] HPPA Linuxthreads.
Message-ID: <20030522162346.GA24335@dsl2.external.hp.com>
References: <20030522151552.GB22338@dsl2.external.hp.com> <200305221553.h4MFrjnW010970@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200305221553.h4MFrjnW010970@hiauly1.hia.nrc.ca>
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

On Thu, May 22, 2003 at 11:53:44AM -0400, John David Anglin wrote:
> Don't know how I missied that :(

If you have a test for this, it's not contending for the lock.
Writing a test for this would probably be a good thing if
there isn't already one. Note there is no fairness and a
test would need to be sensitive to that.

grant
