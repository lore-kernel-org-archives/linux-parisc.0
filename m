From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Expect defunct, kill -9 panics kernel?
Date: Sun, 11 Feb 2007 13:19:52 -0600
Message-ID: <1171221592.3406.32.camel__9339.49033865265$1416624284$gmane$org@mulgrave.il.steeleye.com>
References: <200702101937.l1AJb7Uo014941@hiauly1.hia.nrc.ca>
	<1171158607.3373.54.camel@mulgrave.il.steeleye.com>
	<119aab440702110909r2018a297k98b4f1baed54821a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702110909r2018a297k98b4f1baed54821a@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-11 at 12:09 -0500, Carlos O'Donell wrote:
> How do I validate your guess? Look for a null or bogus curr->func when
> scheduling?

Disassemble the piece in vmlinux for __wait_common and check that the
instruction that faulted is where the code gets the curr->func.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
