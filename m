Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 10 Sep 2003 23:14:09 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030911051409.GA21174@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] login timeout?
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

console login on my a500 running 2.6.0-test5-pa0 says:


Debian GNU/Linux testing/unstable ion ttyS0

ion login: ooro
Password: 
Login incorrect

ion login: 
Login timed out after 60 seconds.

Debian GNU/Linux testing/unstable ion ttyS0

ion login: 

This looks normal but the timeout occurs in about 5 seconds.
Something is broken.

config/vmlinux/etc uploaded to
	ftp://ftp.parisc-linux.org/kernels/a500/2.6.0-test5-pa0.tgz

grant
