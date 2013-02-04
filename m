From: John David Anglin <dave.anglin@bell.net>
Subject: Re: kernel panic
Date: Mon, 04 Feb 2013 15:48:39 -0500
Message-ID: <51101EA7.1030809@bell.net>
References: <510F87A6.1060002@sap.com> <51101176.1020704@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51101176.1020704@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2/4/2013 2:52 PM, Helge Deller wrote:
> I found this kernel panic on one of my machines.
> Seems to be signal-related...
There seem to be two issues.  For the second, can you see any reason
why the pointer to the lock would be corrupt (i.e., point to NULL).

Dave

-- 
John David Anglin    dave.anglin@bell.net

