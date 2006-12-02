From: Marc Zyngier <maz@misterjones.org>
Subject: Re: [parisc-linux] Anyone use a 3c597?
Date: Sat, 02 Dec 2006 16:16:47 +0100
Message-ID: <wrp3b7y2uqo.fsf__24063.28141592$1416624628$gmane$org@wild-wind.fr.eu.org>
References: <45718DBE.30509@excelcia.org>
Reply-To: maz@misterjones.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45718DBE.30509@excelcia.org> (Kurt Fitzner's message of "Sat, 02
	Dec 2006 07:29:18 -0700")
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>>>>> "Kurt" == Kurt Fitzner <kfitzner@excelcia.org> writes:

Kurt,

Kurt> I am looking to pick up an EISA ethernet card.  I've found a
Kurt> 3c597 for fairly cheap, but upon searching I noticed a couple of
Kurt> notes on the mailing list back in 2002/2003 that mentioned
Kurt> issues with this driver.  Does anyone right now have this card
Kurt> working, and if not, does anyone have any suggestions for
Kurt> something EISA?

3c592/3c597 won't work on HPPA because we lack DMA support on the EISA
bus (no documentation). Your best bet is with a pure PIO card. I had
great success with a 3c579 (EISA version of the 3c509) on a C100.

It's only a 10Mbit/s, though.

Regards,

	M.
-- 
And if you don't know where you're going, any road will take you there...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
