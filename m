Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 13 Aug 2003 10:51:55 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030813165155.GE18794@dsl2.external.hp.com>
References: <20030813160532.GG17512@systemhalted> <3F28D766000037C6@ocpmta4.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F28D766000037C6@ocpmta4.freegates.net>
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

On Wed, Aug 13, 2003 at 06:43:27PM +0200, Joel Soete wrote:
> hmm what is an interlock? (just to complet my knowledge)

It's the logic in a CPU to stall an instruction which is waiting
for the results of a previous instruction.
ie the register contents used by the second instruction are not valid
until any previous instruction actually completes.

grant
