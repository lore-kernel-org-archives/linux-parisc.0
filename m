From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] Hacking the PCI Vis-Eg to work on my c3k (corrupt
	fb?)
Date: Sun, 16 Jan 2005 17:32:04 -0600
Message-ID: <200501161732.05030.mszick@wolfbutter.com>
References: <20050116230102.GV1281@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050116230102.GV1281@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun January 16 2005 17:01, Carlos O'Donell wrote:
> 
> pa,
> 
> The video corruption I'm seeing looks like this:
> 
> http://www.baldric.uwo.ca/~carlos/IMGP1025.JPG
> http://www.baldric.uwo.ca/~carlos/IMGP1026.JPG
> http://www.baldric.uwo.ca/~carlos/IMGP1027.JPG
> 
> Any thoughts would be helpfull :)
> 
All of the penguin is in one (sort of) spot, not scattered.
Also has a displacement an approximate % of each dimension.

Some boards store r-g-b bitwise adjacent, some in planes.

Which ever sort a Vis-Eg is, the data is being written
in the other.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
