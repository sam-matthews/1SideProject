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

    # Add changes to array so I add names directly from the app.
    @data = ['','Harry','Sophia','Sam']
    @value = ['','10','15','100']
    
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      # UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:@reuseIdentifier)
    end


    # put your data in the cell
    cell.textLabel.text = @data[indexPath.row]

    if cell.textLabel.text != ''
      cell.detailTextLabel.text = @value[indexPath.row]  
    end
    
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
    alert.message = "#{@data[indexPath.row]} has #{@value[indexPath.row]} points."
    alert.addButtonWithTitle "OK"
    alert.show
  end
end
