From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 21:51:04 +0100
Message-ID: <4AEA0038.6090200@gmx.de>
References: <20091028231026.CDB6F4E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091028231026.CDB6F4E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/29/2009 12:10 AM, John David Anglin wrote:
> Do you know if linux uses the --gc-sections ld option?  This together
> with the GCC -function-sections option might contribute to this problem.

The --gc-sections ld option is not used.
gcc's -function-sections is used.

Helge
