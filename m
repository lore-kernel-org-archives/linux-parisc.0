Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 18 Feb 2003 09:45:56 -0700
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: Joel Soete <jsoe0708@tiscali.be>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] .config fo a N class?
Message-ID: <20030218164556.GA32367@dsl2.external.hp.com>
References: <3E48B5950000297E@ocpmta3.freegates.net> <3E4ABE5000002044@ocpmta2.freegates.net> <20030218025230.GA13514@dsl2.external.hp.com> <20030218084442.GP3715@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030218084442.GP3715@aurinko.ntc.nokia.com>
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

On Tue, Feb 18, 2003 at 10:44:42AM +0200, Nahkola Mikko wrote:
> Come to think of it, is it at all reasonable to assume that the same chip 
> revision would be likely to mean the cards are similar?

hmm..I don't know that.

Use PCI_SUBSYSTEM_VENDOR_ID/PCI_SUBSYSTEM_ID to determine which card
it is exactly.

> Anyway, mine still doesn't work as of today, but I haven't worked on it 
> for a while... oh well, at least on HP-UX it'd be supported on an N, 
> right?

definitely.

grant
