class AlphabetController < UIViewController
  def viewDidLoad
    super

    new_frame = self.view.frame
    new_frame.size.height -= self.tabBarController.tabBar.bounds.size.height
    self.view.frame = new_frame

    self.title = "Count Me Up"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table

    @table.dataSource = self
    @table.delegate = self

    @data = ['','Harry','Sophia','Sam']

    #Motion::Layout.new do |layout|
    #  layout.view view

    #end
    
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end


    # put your data in the cell
    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    # return the number of rows
    @data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    # When user selects a row
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "You tapped #{@data[indexPath.row]} Sam!"
    alert.addButtonWithTitle "Oh No"
    alert.show
  end
end
