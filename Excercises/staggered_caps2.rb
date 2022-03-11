=begin
Staggered Caps (Part 2)
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each
letter. The non-alphabetic characters should still be included in the return
value; they just don't count when toggling the desired case.

Example:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

=end


def staggered_case(string)
  result = ''
  need_upper = true #boolean toggle

  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end

    if /[^a-z]/i.match?(char) #maintains capitalization order while passing non-alphabetics
      need_upper = need_upper
    else
      need_upper = !need_upper #toggles between caps and non-caps
    end
  end
  result
end
