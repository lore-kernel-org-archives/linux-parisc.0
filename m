From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Vis-EG card problems on c3k with 2.6.10-pa10?
Date: Wed, 12 Jan 2005 00:54:19 -0500
Message-ID: <20050112055419.GD1281@baldric.uwo.ca>
References: <20050112051146.GC1281@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050112051146.GC1281@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jan 12, 2005 at 12:11:46AM -0500, Carlos O'Donell wrote:
> I can get something on the screen, but Tux is corrupted beyond
> recognition and gdm is squished to the right.

Let me rephrase that, X starts as a grey rectangle taking up only 1/5 of
the screen on the right hand side. When gdm starts that grey becomes
green.

The fbdev libggi demos don't display anything either, and that rules out
X in my opinion and points to a driver issue.

I'm going to roll back to 2.6.9 and see...

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
