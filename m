From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Wed, 7 Dec 2005 11:54:38 -0700
Message-ID: <20051207185438.GD11417__2191.74407325244$1416624572$gmane$org@colo.lackof.org>
References: <43971676.1010009@gmail.com> <20051207180130.GB11417@colo.lackof.org> <20051207182913.GB32168@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Fabio Bizzi <fbizzi@gmail.com>,
 parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20051207182913.GB32168@quicksilver.road.mcmartin.ca>
Resent-Message-ID: <CWfHbC.A.DzF._3ylDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Wed, Dec 07, 2005 at 01:29:13PM -0500, Kyle McMartin wrote:
> Or the STI rom is completely broken on this card and HP-UX uses software
> instead of the firmware routines.

HPUX *never* supported this card on C-class boxes.
See page 157 (pdf page #) of C200 owners manual:
NOTICE: The A4077A Color Graphics Card, A4078A Dual Color Graphics Card,
        A4079B HCRX-8Z graphics adapter, and the A4071B HCRX-24 graphics
        adapter with the A4072A Z Accelerator attached are not supported
        in the Model C160/C180.

getting it working might be quite "challenging". :)

grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
